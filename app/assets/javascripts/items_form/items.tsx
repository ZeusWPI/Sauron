import React from 'react';

import { Item } from '../items_form.tsx';
import { SubItem } from './index.ts';

interface Props {
  items: Item[];
  removeItem: (i: number) => () => void;
  handleChange: (i: number) => (e: any) => void;
}

class Items extends React.Component<Props, {}> {
  render() {
    let { items, removeItem, handleChange } = this.props;

    if (items.length == 0) { return null; }

    const subItems = items.map((i, key) => {
      return (
        <SubItem
          key={ key }
          id={ key }
          item={ i }
          removeItem={ removeItem(key) }
          handleChange={ handleChange(key) } />
      );
    });

    return (
      <div className='panel-block'>
        <div className='items-wrapper is-fullwidth'>
          <span>Consists of</span>
          { subItems }
        </div>
      </div>
    );
  }
}

export default Items;
