import { cn } from "@/utils";

interface ButtonProps extends React.ComponentPropsWithoutRef<"button"> {
  children: React.ReactNode;
}

export function Button({ children, className, ...props }: ButtonProps) {
  return (
    <button
      type="button"
      className={cn(
        "w-full inline-flex justify-center items-center rounded-md bg-black/60 px-6 py-3 text-base font-medium text-gray-50 shadow-sm hover:bg-gray-300/60 hover:text-black/60 focus:outline-none",
        className
      )}
      {...props}
    >
      {children}
    </button>
  );
}
