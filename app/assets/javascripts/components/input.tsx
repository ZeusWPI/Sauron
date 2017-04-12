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
}

const Input: React.StatelessComponent<Props> =  ({ className, type, placeholder, value, name, onChange }) => {
  return (
    <div className='control'>
      <input
        type={ type }
        className={ classNames({ input: (type != 'submit') }, className) }
        placeholder={ placeholder }
        value={ value || '' }
        name={ name }
        onChange={ onChange } />
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
