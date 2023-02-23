import { createBrowserRouter, RouterProvider } from "react-router-dom";

import "./global.css";

import { Root } from "./components/root";
import { Select } from "./components/select";
import { Create } from "./components/create";
import { Delete } from "./components/delete";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    children: [
      {
        path: "select",
        element: <Select />,
      },
      {
        path: "create",
        element: <Create />,
      },
      {
        path: "delete",
        element: <Delete />,
      },
    ],
  },
]);

export function App() {
  return <RouterProvider router={router} />;
}
