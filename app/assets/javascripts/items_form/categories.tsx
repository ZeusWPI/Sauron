import React from 'react';

import { Category } from '../items_form.tsx';

interface Props {
  isVisible: boolean;
  handleChange: (category: Category) => void;
}
interface State {
  categories: Category[];
}

class Categories extends React.Component<Props, State> {
  constructor() {
    super();
    this.state = {
      categories: null
    }
  }

  componentDidMount() {
    const headers: any = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    fetch('/categories', { headers })
      .then((response) => {
        return response.json()
      })
      .then((json: any) => {
        this.setState({ categories: json.data })
      });
  }

  render () {
    if (!this.props.isVisible) {
      return null;
    }

    const { categories } = this.state;
    const { handleChange } = this.props;

    if (!categories) {
      return (
        <div className='panel-block'>
          Loading categories ...
        </div>
      );
    }

    const blocks = categories.map((c, i) => {
      return (
        <div key={ i } className='panel-block' onClick={ () => handleChange(c) }>{ c.name }</div>
      );
    });

    return (
      <div className='categories-wrapper'>{ blocks }</div>
    );
  }
}

export default Categories;
