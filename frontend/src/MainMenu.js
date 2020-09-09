import React from 'react';
import { Grid } from '@material-ui/core';
import MainMenuDropdown from './MainMenuDropdown';

const MainMenu = ({setCurrentPage}) => {

  const transactionTypesItems = {
    'tranction_type_list': 'Listar Tipos',
    'tranction_type_create': 'Adicionar Tipo'
  }
  const storeItems = {
    'store_list': 'Listar Lojas',
    'store_create': 'Adicionar Loja'
  }

  const transactionItems = {
    'transaction_list': 'Listar Transações',
    'transaction_create': 'Adicionar Transação'
  }

  const batchImportItems = {
    'batch_import_list': 'Listar Importações',
    'batch_import_create': 'Nova Importação'
  }

  return (
    <Grid container spacing={1} direction='row'>
      <MainMenuDropdown menuName='Tipos de Transações' items={transactionTypesItems} setCurrentPage={setCurrentPage}/>
      <MainMenuDropdown menuName='Lojas' items={storeItems} setCurrentPage={setCurrentPage}/>
      <MainMenuDropdown menuName='Transações' items={transactionItems} setCurrentPage={setCurrentPage}/>
      <MainMenuDropdown menuName='Importações' items={batchImportItems} setCurrentPage={setCurrentPage}/>
    </Grid>
  );
}

export default MainMenu;
