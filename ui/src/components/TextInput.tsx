interface TextInputProps extends React.ComponentPropsWithoutRef<"input"> {
  label?: string;
}

export function TextInput({ label, ...props }: TextInputProps) {
  return (
    <div>
      {label ? (
        <label
          htmlFor={props.id}
          className="block text-lg font-medium text-gray-100"
        >
          {label}
        </label>
      ) : null}
      <div className="mt-2">
        <input
          type="text"
          className="block w-full max-w-lg rounded-md border-2 border-transparent focus:border-gray-300 focus:outline-none focus:ring-0 sm:max-w-xs bg-black/60 transition-all"
          {...props}
        />
      </div>
    </div>
  );
}
