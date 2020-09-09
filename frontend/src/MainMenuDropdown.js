import React from 'react';
import { Button, Menu, MenuItem } from '@material-ui/core';

const MainMenuDropdown = ({ menuName, items, setCurrentPage, ...otherProps }) => {
  const [anchorEl, setAnchorEl] = React.useState(null);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = (key) => {
    setAnchorEl(null);
    setCurrentPage(key);
  };
  
  return (
    <>
      <Button aria-controls={menuName} aria-haspopup="true" onClick={handleClick}>
        {menuName}
      </Button>
      <Menu
        id={menuName}
        anchorEl={anchorEl}
        keepMounted
        open={Boolean(anchorEl)}
        onClose={handleClose}
      >
      {
        Object.keys(items).map((key) => {
          return <MenuItem key={key} onClick={() => handleClose(key)}>{items[key]}</MenuItem>
        })
      }
      </Menu>
    </>
  );
}

export default MainMenuDropdown;
