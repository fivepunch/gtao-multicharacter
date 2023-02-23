import { useLocation, Outlet } from "react-router-dom";

function getBackgroundByPathname(pathname: string): string {
  switch (pathname) {
    case "/select":
      return "bg-select";
    case "/create":
      return "bg-create";
  }

  return "bg-select";
}

export function Root() {
  if (__IS_CFX_NUI) {
    return <Outlet />;
  }

  const { pathname } = useLocation();

  return (
    <>
      <div
        className={`${getBackgroundByPathname(
          pathname
        )} w-screen h-screen absolute left-0 top-0`}
      />
      <Outlet />
    </>
  );
}
