import { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { ChevronLeftIcon } from '@heroicons/react/24/solid';

import { FormInput } from '@/types/form';
import { ResourceState } from '@/types/states';

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
    {
      type: 'date',
      name: 'dateOfBirth',
      label: 'Date of birth',
    },
  ]);
}

export function Creation() {
  const [formStructure, setFormStructure] = useState<FormInput[]>([]);

  useEffect(() => {
    (async () => {
      const structure = await window.game.emit<FormInput[]>('getCreateCharacterFormStructure');
      if (!structure) return;

      if (structure.length === 0) {
        return window.game.emit('createCharacter');
      }

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
    <div className="h-screen w-full max-w-[1920px] relative overflow-hidden">
      <motion.div
        className="h-full w-96 absolute p-8 bg-gradient-to-l from-black to-black/20"
        initial={{ right: '-24rem' }}
        animate={{ right: '0rem' }}
        transition={{ duration: 0.8 }}
      >
        <button
          type="button"
          className="text-white font-medium inline-flex items-center"
          onClick={() =>
            window.game.emit('setResourceState', { state: ResourceState.IDLE, parameters: { transition: false } })
          }
        >
          <ChevronLeftIcon className="h-4 w-4 mr-4" />
          Return to selection
        </button>
        <h1 className="w-full inline-flex items-center gap-2 text-white font-bold text-2xl uppercase mt-14">
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
          <span className="inline-flex flex-grow justify-center">Create character</span>
        </h1>
        <form className="flex flex-col gap-4 text-white mt-8" onSubmit={handleSubmit}>
          {formStructure.map(input => (
            <Input key={input.name} {...input} />
          ))}
          <Button type="submit" className="h-10 mt-6 text-lg">
            Create
          </Button>
        </form>
      </motion.div>
    </div>
  );
}
