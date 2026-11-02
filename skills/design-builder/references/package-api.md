# Package authority

## Resolve the consumer version

Work in the consumer project. Resolve `stxdesign-sandbox` through its package manager and lockfile, including workspace or linked-package resolution; record the actual package version and declaration location. Read its package manifest exports/types entries, `dist/index.d.ts` when present, relevant component declarations, README and shipped examples. Follow re-exports to their definitions. This skill does not bundle or require a separate application checkout.

The [official Storybook](https://stxdesign-sandbox.vercel.app) is supplementary design guidance. Establish that an example matches the installed version before using it as API evidence. If declarations and examples disagree, report the mismatch and use the installed contract; inspect the implementation when available to resolve behaviour declarations cannot express.

## Prove each composition before using it

For every component used, confirm its exported name, import path, required props, union values, event signatures, children rules and supported slots/compound parts. In particular, inspect the modal body/footer and action pattern, Alert message/action/dismissal interface, table data and loading interface, input helper placement and copy control. A name listed in a component guide is a discovery hint, not proof it is exported.

Use supported variants and slots before layout CSS. Confirm token names in the installed styles; wire global styles according to that package's setup instructions. The main skill's global CSS import applies only where that path is exported. Never invent props such as a width, footer, loading or action prop from a visual example. If an API accepts an object rather than arbitrary children (or the reverse), honour that shape.

Typecheck real consumer usage with the project's tooling. Inspect wrappers, spreads, `any`, double assertions, `@ts-ignore`, `@ts-expect-error` and lint suppressions around DS usage: a green build with a bypass is not proof of compatibility. Remove or correct misuse within scope; distinguish unrelated suppressions from ones hiding an unsupported composition.

If the package, declarations or matching examples are unavailable, identify exactly what remains unknown. Continue with portable design guidance and supported parts; report a capability gap instead of claiming compatibility or recreating a control. All patterns in these references are layout/behaviour specifications to map to the verified version, not JSX recipes.
