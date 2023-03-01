import { createHashRouter, RouterProvider } from 'react-router-dom';

import './global.css';

import { Root } from '@/components/Root';

import { Idle } from '@/components/Idle';
import { Select } from '@/components/Select';
import { Create } from '@/components/Create';
import { Delete } from '@/components/Delete';

const router = createHashRouter([
  {
    path: '/',
    element: <Root />,
    children: [
      {
        path: '',
        element: <Idle />,
      },
      {
        path: 'select',
        element: <Select />,
      },
      {
        path: 'create',
        element: <Create />,
      },
      {
        path: 'delete',
        element: <Delete />,
      },
    ],
  },
]);

export function App() {
  return <RouterProvider router={router} />;
}

