import { Fragment, useState } from 'react';
import { Listbox, Transition } from '@headlessui/react';
import { CheckIcon, ChevronUpDownIcon } from '@heroicons/react/20/solid';

import { cn } from '@/utils';

interface SelectOption<T extends unknown> {
  value: T;
  label: string;
}

interface SelectInputProps<T> extends React.ComponentPropsWithoutRef<'input'> {
  label?: string;
  options: SelectOption<T>[];
}

// When creating custom inputs that don't have a <input /> we should use an <input type="hidden" /> to bind it's value to the form data
export function SelectInput<T extends SelectInputProps<unknown>>({ label, options, ...props }: T) {
  const [selected, setSelected] = useState(options[0]);

  return (
    <div>
      <Listbox value={selected} onChange={setSelected}>
        {({ open }) => (
          <>
            {label ? <Listbox.Label className="block text-lg font-medium text-gray-100">{label}</Listbox.Label> : null}
            <div className="relative mt-1">
              <Listbox.Button className="relative w-full cursor-default rounded-md outline-none border-2 border-transparent focus:border-gray-300 bg-black/60 py-2 pl-3 pr-10 text-left transition-all">
                <span className="block truncate">{selected.label}</span>
                <span className="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-2">
                  <ChevronUpDownIcon className="h-5 w-5 text-gray-400" aria-hidden="true" />
                </span>
              </Listbox.Button>

              <Transition
                show={open}
                as={Fragment}
                leave="transition ease-in duration-100"
                leaveFrom="opacity-100"
                leaveTo="opacity-0"
              >
                <Listbox.Options className="z-10 mt-1 max-h-60 w-full overflow-auto rounded-md bg-black/60 py-1 text-base shadow-lg ring-1 ring-gray-300 ring-opacity-5 focus:outline-none">
                  {options.map((option, index) => (
                    <Listbox.Option
                      key={`select-option-${index}`}
                      className={({ active }) =>
                        cn(
                          active ? 'text-black/80 bg-gray-300/60' : false,
                          'relative cursor-default select-none py-2 pl-3 pr-9',
                        )
                      }
                      value={option}
                    >
                      {({ selected, active }) => (
                        <>
                          <span className={cn(selected ? 'font-semibold' : 'font-normal', 'block truncate')}>
                            {option.label}
                          </span>

                          {selected ? (
                            <span
                              className={cn(
                                active ? 'text-black/80' : 'text-white',
                                'absolute inset-y-0 right-0 flex items-center pr-4',
                              )}
                            >
                              <CheckIcon className="h-5 w-5" aria-hidden="true" />
                            </span>
                          ) : null}
                        </>
                      )}
                    </Listbox.Option>
                  ))}
                </Listbox.Options>
              </Transition>
            </div>
          </>
        )}
      </Listbox>
      <input {...props} type="hidden" value={selected.value} />
    </div>
  );
}
