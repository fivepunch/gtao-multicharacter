import { createHashRouter, RouterProvider } from 'react-router-dom';

import './global.css';

import { Root } from '@/components/Root';

import { Selection } from '@/components/Selection';
import { Select } from '@/components/Select';
import { Creation } from '@/components/Creation';
import { Delete } from '@/components/Delete';

const router = createHashRouter([
  {
    path: '/',
    element: <Root />,
    children: [
      {
        path: 'selection',
        element: <Selection />,
        children: [
          {
            path: 'select',
            element: <Select />,
          },
          {
            path: 'delete',
            element: <Delete />,
          },
        ],
      },
      {
        path: 'creation',
        element: <Creation />,
      },
    ],
  },
]);

export function App() {
  return <RouterProvider router={router} />;
}

