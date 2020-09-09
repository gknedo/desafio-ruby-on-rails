import React from 'react';
import MainMenu from './MainMenu';

function App() {
  const [currentPage, setCurrentPage] = React.useState('none');

  return (
    <>
      <MainMenu setCurrentPage={setCurrentPage}/>
      {currentPage}
    </>
  );
}

export default App;
