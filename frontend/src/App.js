import React from 'react';
import MainMenu from './MainMenu';
import TransactionTypeList from './TransactionTypeList';

function App() {
  const [currentPage, setCurrentPage] = React.useState('none');

  return (
    <>
      <MainMenu setCurrentPage={setCurrentPage}/>
      {currentPage == 'tranction_type_list' && <TransactionTypeList/>}
    </>
  );
}

export default App;
