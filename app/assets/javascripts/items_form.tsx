import React from 'react';
import { render } from 'react-dom';

import { NumberField, TextField, Submit } from './components/input.tsx';
import { Categories, Items } from './items_form/index.ts';
import { POST } from './actions/fetch.ts';

export interface Item {
  name: string;
  description: string;
  price?: number;
  category?: Category;
}

export interface Category {
  id: number;
  name: string;
}

interface State {
  isComposed: boolean;
  item: Item;
  items: Item[];
  categoriesVisible: boolean;
}

const getItem: () => Item = () => {
  return { name: null, description: null, price: null, category: null };
}


class ItemsForm extends React.Component<{}, State> {
  constructor() {
    super();
    this.state = {
      isComposed: false,
      item: getItem(),
      items: [],
      categoriesVisible: false
    };

    this.onSubmit = this.onSubmit.bind(this);
    this.addItem = this.addItem.bind(this);
    this.removeItem = this.removeItem.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleItemChange = this.handleItemChange.bind(this);
    this.toggleCategory = this.toggleCategory.bind(this);
    this.handleCategoryChange = this.handleCategoryChange.bind(this);
  }

  onSubmit(e : any) {
    e.preventDefault();

    const item: any = { ...this.state.item };
    item['category_id'] = this.state.item.category ? this.state.item.category.id : null;
    item['category'] = undefined;

    if (this.state.items.length != 0) {
      item['items_attributes'] = this.state.items.map((i: any) => {
        const child = { ...i };
        child['category_id'] = item.category_id;
        child['category'] = undefined;
        return child;
      });
      item['type'] = 'ComposedItem';
    }

    POST('/items', { item }, (d) => console.log(d), (d) => console.log(d));
  }

  addItem() {
    this.setState({ items: [...this.state.items, getItem()] });
  }

  removeItem(i: number) {
    return () => {
      let { items } = this.state;
      this.setState({ items: [...items.slice(0, i), ...items.slice(i+1)] });
    }
  }

  handleChange(e: any) {
    let { item } = this.state;
    this.setState({ item: { ...item, [e.target.name]: e.target.value } });
  }

  handleItemChange(i: number) {
    return (e: any) => {
      let { items } = this.state;
      this.setState({ items: [
        ...items.slice(0, i),
        { ...items[i], [e.target.name]: e.target.value },
        ...items.slice(i+1)
      ] });
    }
  }

  handleCategoryChange(category: Category) {
    let { item } = this.state;
    this.setState({ item: { ...item, category }, categoriesVisible: false });
  }

  toggleCategory() {
    this.setState({ categoriesVisible: !this.state.categoriesVisible });
  }

  render() {
    let { items, item: { name, description, price, category } } = this.state;

    return (
      <form id='items-form' onSubmit={ this.onSubmit }>
        <div className='panel'>
          <div className='panel-heading'>
            Item Information
          </div>
          <div className='panel-block with-field'>
            <TextField placeholder='Name' value={ name } name='name' onChange={ this.handleChange } />
          </div>
          <div className='panel-block with-field'>
            <TextField placeholder='Description' value={ description } name='description' onChange={ this.handleChange } />
          </div>
          <div className='panel-block with-field'>
            <NumberField placeholder='Base Price' value={ price } name='price' onChange={ this.handleChange } />
          </div>
          <div className='panel-block click' onClick={ this.toggleCategory }>
            { (category && category.name) || <span className='placeholder'>Category</span> }
          </div>
          <Categories isVisible={ this.state.categoriesVisible } handleChange={ this.handleCategoryChange } />
          <Items items={ items } removeItem={ this.removeItem } handleChange={ this.handleItemChange } />
          <div className='panel-block'>
            <div className='field is-grouped'>
              <div className='control'>
                <button type='button' className='button' onClick={ this.addItem }>
                  Add component
                </button>
              </div>
              <Submit value='Create' className='button is-primary' />
            </div>
          </div>
        </div>
      </form>
    );
  }
}

render(<ItemsForm />, document.getElementById('items-form'));
