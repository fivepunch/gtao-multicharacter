import { motion } from 'framer-motion';

interface BottomMenuProps {
  children: React.ReactNode;
}

export function BottomMenu({ children }: BottomMenuProps) {
  return (
    <motion.div
      className="h-32 w-full absolute bg-gradient-to-t from-black to-black/30"
      initial={{ bottom: '-8rem' }}
      animate={{ bottom: '0rem' }}
      transition={{ duration: 0.8 }}
    >
      <div className="max-w-[1920px] w-full h-full flex items-center gap-16 px-24 py-4">{children}</div>
    </motion.div>
  );
}
