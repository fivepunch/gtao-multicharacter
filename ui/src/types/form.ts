interface _FormInput {
  name: string;
  label: string;
  type: string;
}

interface FormTextInput extends _FormInput {
  type: 'text';
}

interface FormSelectInput extends _FormInput {
  type: 'select';
  options: { value: unknown; label: string }[];
}

export type FormInput = FormTextInput | FormSelectInput;
