import React from 'react';
import classNames from 'classnames';

interface Props extends CProps {
  type: string;
}

interface CProps {
  placeholder?: string;
  value?: any;
  className?: string;
  name?: string;
  onChange?: (e: any) => void;
  hasError?: boolean;
}

const Input: React.StatelessComponent<Props> =  ({ className, type, placeholder, value, name, onChange, hasError = false }) => {
  const errorTag = (
    <span className='icon is-small tooltip'>
      <i className='fa fa-warning'></i>
      <span className='tooltip-message'>
        Error
      </span>
    </span>
  );
  const error = hasError ? errorTag : null;

  return (
    <div className={ classNames('control', { ' has-icon has-icon-right': hasError }) }>
      <input
        type={ type }
        className={ classNames({ input: (type != 'submit') }, className) }
        placeholder={ placeholder }
        value={ value || '' }
        name={ name }
        onChange={ onChange } />
      { error }
    </div>
  );
}

const TextField: React.StatelessComponent<CProps> = (props) => {
  return (
    <Input type='text' { ...props } />
  );
}

const NumberField: React.StatelessComponent<CProps> = (props) => {
  return (
    <Input type='number' { ...props } />
  );
}

const Submit: React.StatelessComponent<CProps> = (props) => {
  return (
    <Input type='submit' { ...props } />
  );
}

export { TextField, NumberField, Submit };
