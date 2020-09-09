import React from 'react';
import { Grid } from '@material-ui/core';
import MainMenuDropdown from './MainMenuDropdown';

const MainMenu = () => {

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
    'transaction_list': 'Listar Importações',
    'transaction_create': 'Nova Importação'
  }

  return (
    <Grid container spacing={1} direction='row'>
      <MainMenuDropdown menuName='Tipos de Transações' items={transactionTypesItems}/>
      <MainMenuDropdown menuName='Lojas' items={storeItems}/>
      <MainMenuDropdown menuName='Transações' items={transactionItems}/>
      <MainMenuDropdown menuName='Importações' items={batchImportItems}/>
    </Grid>
  );
}

export default MainMenu;
