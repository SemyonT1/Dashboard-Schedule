import React from 'react';

const SelectInput = ({ options, label, onChange, value }) => {
  return (
    <div className="mb-4">
      <label className="block text-sm font-medium text-gray-700 mb-1">
        {label}
      </label>
      <select
        className="w-full p-2 border border-gray-300 rounded-md"
        onChange={onChange}
        value={value}
      >
        <option value="">Выберите...</option>
        {options.map((option) => (
          <option key={option.id} value={option.id}>
            {option.title || option.fio || option.room}
          </option>
        ))}
      </select>
    </div>
  );
};

export default SelectInput;