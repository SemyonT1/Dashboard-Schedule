import React from 'react';

const SelectInput = ({ options, value = '', onChange, label }) => {
  return (
    <div className="mb-4">
      {label && <label className="block text-sm font-medium mb-1">{label}</label>}
      <select
        className="border rounded p-2 w-full"
        value={value || ''}
        onChange={(e) => onChange(e.target.value)}
      >
        <option value="">Выберите...</option>
        {options?.map((option) => (
          <option key={option.value} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
    </div>
  );
};

export default SelectInput;