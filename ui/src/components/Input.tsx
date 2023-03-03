import { FormInput } from '@/types/form';

import { TextInput } from '@/components/TextInput';
import { SelectInput } from '@/components/SelectInput';

export function Input(props: FormInput) {
  if (props.type === 'text') {
    return <TextInput {...props} />;
  }

  if (props.type === 'select') {
    return <SelectInput {...props} />;
  }

  return null;
}
