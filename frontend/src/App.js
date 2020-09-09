import React from 'react';
import MainMenu from './MainMenu';
import TransactionTypeList from './TransactionTypeList';
import TransactionList from './TransactionList';
import BatchImportList from './BatchImportList';
import StoreList from './StoreList';

function App() {
  const [currentPage, setCurrentPage] = React.useState('none');

  const getPageComponent = () => {
    switch (currentPage) {
      case 'none':
        return null;
      case 'transaction_type_list':
        return <TransactionTypeList/>;
      case 'transaction_list':
        return <TransactionList/>;
      case 'store_list':
        return <StoreList/>;
      case 'batch_import_list':
        return <BatchImportList/>;
      case 'batch_import_create':
        return <BatchImportList createEnabled/>;
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
