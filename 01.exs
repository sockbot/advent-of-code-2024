input = File.read!("inputs/01.txt")

_input = "3   4
4   3
2   5
1   3
3   9
3   3
"

input
  |> String.split("\n", trim: true)
  |> Enum.map(&String.split/1)
  |> Enum.map(fn nums -> Enum.map(nums, &String.to_integer/1) end)
  |> Enum.zip()
  |> Enum.map(&Tuple.to_list/1)
  |> Enum.map(&Enum.sort/1)
  |> fn [list1, list2] -> Enum.zip_with(list1, list2, fn left, right -> abs(right - left) end) end.()
  |> Enum.sum()
  |> IO.inspect

input
  |> String.split("\n", trim: true)
  |> Enum.map(&String.split/1)
  |> Enum.map(fn nums -> Enum.map(nums, &String.to_integer/1) end)
  |> Enum.zip()
  |> Enum.map(&Tuple.to_list/1)
  |> fn [list1, list2] ->
    freq = Enum.frequencies(list2)
    Enum.map(list1, fn x -> x * Map.get(freq, x, 0) end)
  end.()
  |> Enum.sum()
  |> IO.inspect
