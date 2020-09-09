import React from 'react';
import { Button, Menu, MenuItem } from '@material-ui/core';

const MainMenuDropdown = ({ menuName, items, ...otherProps }) => {
  const [anchorEl, setAnchorEl] = React.useState(null);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
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
          return <MenuItem key={key} onClick={handleClose}>{items[key]}</MenuItem>
        })
      }
      </Menu>
    </>
  );
}

export default MainMenuDropdown;
