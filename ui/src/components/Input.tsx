import { FormInput, FormTextInput, FormSelectInput } from '@/types/form';

import { TextInput } from '@/components/TextInput';
import { SelectInput } from '@/components/SelectInput';

function isTextInput(input: FormInput): input is FormTextInput {
  return input.type === 'text';
}

function isSelectInput(input: FormInput): input is FormSelectInput {
  return input.type === 'select';
}

export function Input(input: FormInput) {
  const props: FormInput & { id: string } = { ...input, id: input.name };

  if (isTextInput(props)) {
    return <TextInput {...props} />;
  }

  if (isSelectInput(props)) {
    return <SelectInput {...props} />;
  }

  return (
    <div>
      {props.label ? (
        <label htmlFor={props.id} className="block text-lg font-medium text-gray-100">
          {props.label}
        </label>
      ) : null}
      <div className="mt-2">
        <input
          className="block w-full max-w-lg rounded-md border-2 border-transparent focus:border-gray-300 focus:outline-none focus:ring-0 sm:max-w-xs bg-black/60 transition-all [color-scheme:dark]"
          {...props}
        />
      </div>
    </div>
  );
}
