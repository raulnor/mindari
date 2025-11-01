# 987654321 / 123456789 ≈ 8
# 0xFEDCBA987654321 / 0x123456789ABCDEF ≈ 14
# This pattern holds true for many bases
#
# Ref: https://www.johndcook.com/blog/2025/10/26/987654321/

defmodule BaseDivisor do
  # Test bases 2 to 36 with String.to_integer/1
  defp base_test_naive(base) do
    digits = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    s = String.slice(digits, 0, base - 1)
    n = s |> String.reverse() |> String.to_integer(base)
    d = s |> String.to_integer(base)
    n / d
  end

  defp div(base) do
    1..(base-1) |> Enum.reduce(0, fn digit, acc -> acc * base + digit end)
  end

  defp nom(base) do
    (base-1)..1//-1 |> Enum.reduce(0, fn digit, acc -> acc * base + digit end)
  end

  # Test with floating point division. Works up to 143.
  defp base_test_float(base) do
    nom(base) / div(base)
  end

  # Test by using integer division. Assumes result is close to an integer.
  defp base_test_integer(base) do
    n = nom(base)
    d = div(base)
    true = (rem(n, d) == base - 1) # Assert division is a tiny fraction
    div(n, d)
  end

  def base_test(base) when base < 128, do: base_test_float(base)
  def base_test(base) when base >= 128, do: base_test_integer(base)
end

# BaseDivisor.nom(10) |> IO.puts()
# BaseDivisor.div(10) |> IO.puts()
# BaseDivisor.nom(16) |> IO.puts()
# 0xFEDCBA987654321 |> IO.puts()
# BaseDivisor.div(16) |> IO.puts()
# 0x123456789ABCDEF |> IO.puts()

# Enum.each([10, 20, 30, 36, 140], fn base ->
#   {time1, _} = :timer.tc(fn ->
#     Enum.each(1..10000, fn _ -> BaseDivisor.base_test(base) end)
#   end)

#   {time2, _} = :timer.tc(fn ->
#     Enum.each(1..10000, fn _ -> BaseDivisor.base_test_approx(base) end)
#   end)

#   IO.puts("Base #{base}:")
#   IO.puts("  base_test:  #{time1} μs")
#   IO.puts("  base_test_approx: #{time2} μs")
#   IO.puts("  Speedup: #{Float.round(time1 / time2, 2)}x")
# end)

Enum.each([2, 10, 16, 20, 30, 36, 50, 100, 1000, 10000], fn base ->
  IO.puts("Base #{base} = #{BaseDivisor.base_test(base)}")
end)
