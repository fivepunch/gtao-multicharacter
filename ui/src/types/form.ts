type FormInputTypes = React.ComponentPropsWithoutRef<'input'>['type'];

interface GenericFormInput {
  name: string;
  label: string;
  type: FormInputTypes;
}

export interface FormTextInput extends GenericFormInput {
  type: 'text';
}

export interface FormSelectInput extends GenericFormInput {
  type: 'select';
  options: { value: unknown; label: string }[];
}

export type FormInput = FormTextInput | FormSelectInput | GenericFormInput;
