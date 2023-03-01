interface ArrowsProps {
  onLeftArrowClick?: () => void;
  onRightArrowClick?: () => void;
}

export function Arrows({ onLeftArrowClick, onRightArrowClick }: ArrowsProps) {
  return (
    <div className="w-full flex justify-between absolute px-24 top-1/2 -translate-y-1/2">
      <button
        type="button"
        className="transition-all opacity-75 hover:opacity-100"
        onClick={() => {
          onLeftArrowClick && onLeftArrowClick();
        }}
      >
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
          className="h-24 w-24"
        >
          <polyline points="15 18 9 12 15 6"></polyline>
        </svg>
      </button>
      <button
        type="button"
        className="transition-all opacity-75 hover:opacity-100"
        onClick={() => {
          onRightArrowClick && onRightArrowClick();
        }}
      >
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
          className="h-24 w-24"
        >
          <polyline points="9 18 15 12 9 6"></polyline>
        </svg>
      </button>
    </div>
  );
}
