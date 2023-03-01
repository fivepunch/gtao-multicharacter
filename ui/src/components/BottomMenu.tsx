interface BottomMenuProps {
  children: React.ReactNode;
}

export function BottomMenu({ children }: BottomMenuProps) {
  return (
    <div className="h-32 w-full absolute bottom-0 bg-gradient-to-t from-black to-black/30">
      <div className="max-w-[1920px] w-full h-full flex items-center gap-16 px-24 py-4">{children}</div>
    </div>
  );
}
