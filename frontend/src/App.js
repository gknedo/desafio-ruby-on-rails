import React from 'react';
import MainMenu from './MainMenu';
import TransactionTypeList from './TransactionTypeList';
import StoreList from './StoreList';

function App() {
  const [currentPage, setCurrentPage] = React.useState('none');

  const getPageComponent = () => {
    switch (currentPage) {
      case 'none':
        return null;
      case 'transaction_type_list':
        return <TransactionTypeList/>;
      case 'store_list':
        return <StoreList/>;
      default:
        return 'Funcionalidade não implementada'
    }
  }

  return (
    <>
      <MainMenu setCurrentPage={setCurrentPage}/>
      {getPageComponent()}
    </>
  );
}

export default App;
