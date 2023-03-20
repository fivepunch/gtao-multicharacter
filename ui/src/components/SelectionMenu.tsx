import { Arrows } from '@/components/Arrows';
import { BottomMenu } from '@/components/BottomMenu';

interface SelectionMenuProps {
  options: React.ReactNode;
}

export function SelectionMenu({ options }: SelectionMenuProps) {
  const onPrevious = (): void => {
    window.game.emit('previousCharacters');
  };

  const onNext = (): void => {
    window.game.emit('nextCharacters');
  };

  return (
    <div className="w-screen h-screen text-white font-inter relative overflow-hidden">
      <Arrows onLeftArrowClick={onPrevious} onRightArrowClick={onNext} />
      <BottomMenu>{options}</BottomMenu>
    </div>
  );
}
