import { ClassValue, clsx } from "clsx";

export function cn(...classNames: ClassValue[]): string {
  return clsx(classNames);
}
