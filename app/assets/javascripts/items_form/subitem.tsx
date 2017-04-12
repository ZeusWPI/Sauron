import React from 'react';

import { NumberField, TextField } from '../components/input.tsx';
import { Item } from '../items_form.tsx';

interface Props {
  id: number;
  item: Item;
  removeItem: () => void;
  handleChange: (e: any) => void;
}

const SubItem: React.StatelessComponent<Props> = props => {
  let { id, removeItem, handleChange, item: { name, description, price } } = props;

  return (
    <div className='panel'>
      <div className='panel-heading sub-item'>
        Part { id + 1 }
        <span className='icon click' onClick={ removeItem }>
          <i className='fa fa-close'></i>
        </span>
      </div>
      <div className='panel-block with-field'>
        <TextField placeholder='Name' value={ name } name='name' onChange={ handleChange } />
      </div>
      <div className='panel-block with-field'>
        <TextField placeholder='Description' value={ description } name='description' onChange={ handleChange } />
      </div>
      <div className='panel-block with-field'>
        <NumberField placeholder='Base Price' value={ price } name='price' onChange={ handleChange } />
      </div>
    </div>
  );
}

export default SubItem;
