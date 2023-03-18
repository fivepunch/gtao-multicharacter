import { useEffect } from 'react';
import { useNavigate, useLocation, Outlet } from 'react-router-dom';

import { ResourceState } from '@/types/states';

if (!__IS_CFX_NUI) {
  window.game.mock('setResourceState', (state: ResourceState) => {
    switch (state) {
      case ResourceState.IDLE:
        window.game.fakeGameMessage('navigate', '/idle');
        break;
      case ResourceState.SELECT:
        window.game.fakeGameMessage('navigate', '/select');
        break;
      case ResourceState.CREATE:
        window.game.fakeGameMessage('navigate', '/create');
        break;
      case ResourceState.DELETE:
        window.game.fakeGameMessage('navigate', '/delete');
        break;
    }
  });
}

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
  }, []);

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
