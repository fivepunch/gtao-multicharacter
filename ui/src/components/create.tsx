import { useState, useEffect } from 'react';

import { FormInput } from '@/types/form';

import { Input } from '@/components/Input';
import { Button } from '@/components/Button';

if (!__IS_CFX_NUI) {
  window.game.mock('getCreateCharacterFormStructure', (): FormInput[] => [
    {
      type: 'text',
      name: 'firstName',
      label: 'First name',
    },
    {
      type: 'text',
      name: 'lastName',
      label: 'Last name',
    },
    {
      type: 'select',
      name: 'gender',
      label: 'Gender',
      options: [
        { value: true, label: 'Male' },
        { value: false, label: 'Female' },
      ],
    },
  ]);
}

export function Create() {
  const [formStructure, setFormStructure] = useState<FormInput[]>([]);

  useEffect(() => {
    (async () => {
      const structure = await window.game.emit<FormInput[]>('getCreateCharacterFormStructure');
      if (!structure) return;

      setFormStructure(structure);
    })();
  }, []);

  async function handleSubmit(event: React.FormEvent<HTMLFormElement>): Promise<void> {
    event.preventDefault();

    const formData = new FormData(event.currentTarget);

    const form = Object.fromEntries(formData.entries());

    await window.game.emit('createCharacter', form);
  }

  return (
    <div className="h-screen w-full max-w-[1920px]">
      <div className="h-full w-96 absolute right-0 p-8 bg-gradient-to-l from-black to-black/20">
        <h1 className="w-full inline-flex justify-center items-center gap-2 text-white font-bold text-2xl uppercase">
          <span>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
            >
              <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path>
              <circle cx="9" cy="7" r="4"></circle>
              <line x1="19" y1="8" x2="19" y2="14"></line>
              <line x1="22" y1="11" x2="16" y2="11"></line>
            </svg>
          </span>
          Create character
        </h1>
        <form className="flex flex-col gap-4 text-white mt-8" onSubmit={handleSubmit}>
          {formStructure.map(input => (
            <Input {...input} />
          ))}
          <Button type="submit" className="h-10 mt-6 text-lg">
            Create
          </Button>
        </form>
      </div>
    </div>
  );
}
