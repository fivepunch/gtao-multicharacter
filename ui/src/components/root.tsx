import { useEffect } from 'react';
import { useNavigate, useLocation, Outlet } from 'react-router-dom';

function getBackgroundByPathname(pathname: string): string {
  switch (pathname) {
    case '/select':
      return 'bg-select';
    case '/create':
      return 'bg-create';
  }

  return 'bg-select';
}

export function Root() {
  const navigate = useNavigate();
  const { pathname } = useLocation();

  useEffect(() => {
    const disposeNavigateEvent = window.game.addEventListener('navigate', (path: string) => {
      console.log(`Navigating to path: ${path}`);

      navigate(path);
    });

    return () => {
      disposeNavigateEvent();
    };
  }, [navigate]);

  if (__IS_CFX_NUI) {
    return <Outlet />;
  }

  return (
    <>
      <div className={`${getBackgroundByPathname(pathname)} w-screen h-screen absolute left-0 top-0 -z-10`} />
      <Outlet />
    </>
  );
}
