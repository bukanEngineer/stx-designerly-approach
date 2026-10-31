---
components: [Upload]
---

# Upload

A single-file uploader that lets the user attach a document via drag-and-drop or file picker, with a thumbnail preview and inline validation feedback before submission.

---

## Guidelines

### When to use

- When a flow requires the user to submit a document — such as identity verification, proof of address, or compliance uploads — and visual confirmation of the file is important before submission.

- When the accepted formats and file size constraints need to be communicated upfront, reducing failed uploads and support requests.

- When the file must be reviewable by the user before final submission — for example, previewing a scanned ID before confirming it's the correct document

### When not to use

- If multiple files can be uploaded simultaneously, do not use this single-file component. Design a multi-file uploader variant instead.

- If no preview is needed and the upload is purely functional (e.g. importing a CSV), use a simpler inline file input pattern that does not imply a visual preview step.

- Do not use this component inside a compact form where vertical space is constrained — the preview card height may conflict with the form layout.

## Behavior

- The drop zone accepts drag-and-drop in addition to the "Upload" button click. Both interactions should open the same file-picker or accept the dragged file.

- In the  **uploaded**  state, the filename is rendered as a link-style text — this indicates the file name is tappable but does not navigate; it identifies the file only

- The  **Preview**  button opens the file in a new tab or modal — it does not submit it. The  **Delete**  button removes the file and returns the component to the  **default**  state without confirmation

- Clicking  **Delete**  in the error state also returns the component to the  **default**  state, clearing the error.

- Accepted file types and the maximum file size are defined per project — the component does not enforce a fixed rule. The helper text in the default state and the inline error message in the error state should be supplied by the consuming team to reflect their specific constraints, If the uploaded file violates the project's constraints, the component transitions to the  **error**  state

## Placement

- The Upload component is typically placed inside a form section

- On mobile, the component scales to full viewport width minus standard horizontal padding
