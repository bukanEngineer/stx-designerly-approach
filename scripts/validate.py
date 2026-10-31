#!/usr/bin/env python3
"""Validate the bundled skill metadata, local references and portable distribution."""
from pathlib import Path
import re
import sys
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parent.parent
SKILLS = ROOT / "skills"
errors = []


def fail(path, message):
    errors.append(f"{path.relative_to(ROOT)}: {message}")


def headings(path):
    text = re.sub(r"```.*?```", "", path.read_text(), flags=re.S)
    result = set()
    counts = {}
    for title in re.findall(r"^#{1,6}\s+(.+)$", text, re.M):
        slug = re.sub(r"[^\w\s-]", "", title.lower()).replace(" ", "-")
        count = counts.get(slug, 0)
        counts[slug] = count + 1
        result.add(f"{slug}-{count}" if count else slug)
    return result


for entry in sorted(SKILLS.glob("*/SKILL.md")):
    text = entry.read_text()
    parts = text.split("---\n", 2)
    if len(parts) != 3 or parts[0]:
        fail(entry, "frontmatter requires opening and closing --- lines")
        continue
    # Repository metadata uses plain, single-line YAML scalars; no YAML dependency needed.
    fields = {}
    for line in parts[1].splitlines():
        match = re.fullmatch(r"(name|description): (.+)", line)
        if not match:
            fail(entry, f"expected a single-line name/description scalar: {line!r}")
            continue
        key, value = match.groups()
        if key in fields:
            fail(entry, f"duplicate {key}")
        if ": " in value or " #" in value or value.startswith(tuple("[{&*!|>'\"%@`")):
            fail(entry, f"{key} must be a plain YAML scalar without YAML syntax")
        fields[key] = value
    name = fields.get("name", "")
    if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", name) or len(name) > 64:
        fail(entry, "invalid skill name")
    if name != entry.parent.name:
        fail(entry, "name must match directory")
    if not fields.get("description"):
        fail(entry, "missing description")

files = [ROOT / "README.md", *SKILLS.rglob("*.md")]
links = 0
for path in files:
    text = path.read_text()
    # Inline Markdown destinations and literal relative .md references in backticks.
    targets = re.findall(r"\[[^\]\n]*\]\(([^)\n]+)\)", text)
    targets += re.findall(r"`([^`\n<>*]+\.md(?:#[^`\n]+)?)`", text)
    for raw in targets:
        target = raw.strip().strip("<>")
        parts = urlsplit(target)
        if parts.scheme or parts.netloc:
            continue
        if target.startswith("/"):
            fail(path, f"absolute reference: {target}")
            continue
        dest = (path.parent / unquote(parts.path)).resolve()
        if not dest.is_relative_to(ROOT):
            fail(path, f"reference leaves the distribution: {target}")
        elif not dest.exists():
            fail(path, f"missing relative reference: {target}")
        elif parts.fragment and dest.suffix == ".md" and unquote(parts.fragment) not in headings(dest):
            fail(path, f"missing heading: {target}")
        links += 1

# These references must ship together, regardless of install destination.
for name in ("stx-designerly-approach", "stx-design-verify"):
    if not (SKILLS / name / "SKILL.md").is_file():
        errors.append(f"skills/{name}/SKILL.md: missing distribution entry")
for required in ("LICENSE", "ATTRIBUTION.md"):
    if not (SKILLS / "stx-design-verify" / required).is_file():
        errors.append(f"skills/stx-design-verify/{required}: required for adapted third-party content")

# Scan shipped text for workstation paths.
local_path = re.compile(r"/(?:Users|home)/[^\s/]+|[A-Za-z]:\\")
for path in [*files, *ROOT.joinpath("scripts").glob("*")]:
    if path.is_file() and local_path.search(path.read_text()):
        fail(path, "local workstation path")

if errors:
    print("\n".join(errors), file=sys.stderr)
    sys.exit(1)
print(f"Validated {len(list(SKILLS.glob('*/SKILL.md')))} skills and {links} relative references.")
