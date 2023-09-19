defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {m_type, m_vol} = volume_pair
    cond do
        m_type == :cup -> {:milliliter, 240 * m_vol}
        m_type == :fluid_ounce -> {:milliliter, 30 * m_vol}
        m_type == :teaspoon -> {:milliliter, 5 * m_vol}
        m_type == :tablespoon -> {:milliliter, 15 * m_vol}
        true -> volume_pair
    end 
  end 

  def from_milliliter(volume_pair, unit) do
    {_, m_vol} = volume_pair
    cond do
        unit == :cup -> {unit, m_vol/240}
        unit == :fluid_ounce -> {unit, m_vol/30}
        unit == :teaspoon -> {unit, m_vol/5}
        unit == :tablespoon -> {unit, m_vol/15}
        true -> volume_pair
      end
  end 

  def convert(volume_pair, unit) do
    temp_pair = to_milliliter(volume_pair)
    from_milliliter(temp_pair, unit)
  end
end
