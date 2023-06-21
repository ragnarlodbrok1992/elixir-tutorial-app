# Introduction to elixir!
# Printing hello world.

IO.puts("Hello, world!")

# Sadly
# no multiline comments

# Convert some data structure to it's string
# representation. Here is a list

some_list = [1, 2, 3, "Hello, sailor!"]
some_list
|> IO.inspect(label: "some_list: ")

# |> operator - pipe operator, you dont have to
# function/method chain, just pipe them

# Modules - organising code into namespaces

defmodule SomeGuy do
  # Modules attributes
  # Mostly used as constants

  @greeting "Bonjour"

  def greeting(name) do
    # IO.puts("Hello, #{name}!")
    IO.puts(~s(#{@greeting} #{name}.))
  end
end

SomeGuy.greeting "TwojStary"

# Structs - using defstruct, kinda classes

defmodule SomeDude do
  defstruct name: "Pinokio", roles: []
end

# Aliasing - namespacing with as
defmodule Sayings.Greetings do 
  def basic(name), do: IO.puts "Hi, #{name}!!!"
end

defmodule GreetingsExample do
  alias Sayings.Greetings

  def greeting(name), do: Greetings.basic(name)

end

# Functions
sum = fn (a, b) -> a + b end

IO.puts(sum.(34, 35))

# Defining functions in modules
defmodule Math do
  def sum(a, b), do: a + b

  def super_stuff(a, b, c) do
    d = a + b
    b = a * 2 + c
    c + b + d
  end

  # Default arguments
  def add_to_ten_or_not(a, b \\ 10), do: a + b
end

# Pipe operator
IO.inspect("Twoja stara napierdala" |> String.upcase() |> String.split())

# We doing main function like a real men!
defmodule Main do
  # Difference between code in file and repl stuff
  # You have to define "main" function for stuff to work properly
  def main do
    some_guy = %SomeDude{}
    IO.puts(some_guy.name)
    IO.puts(some_guy.roles)

    IO.inspect some_guy # Doing it FP style

    GreetingsExample.greeting "Madafaka"

    # Using functions defined in modules
    IO.puts Math.sum(1, 3)
    IO.puts Math.sum(34, 35) 

    IO.puts Math.super_stuff(1, 2, 3)

    IO.puts Math.add_to_ten_or_not(3)
    IO.puts Math.add_to_ten_or_not(3, 20)

    # Sigils - some stuff
    IO.puts ~c/2 + 7 = #{2 + 7}/
    IO.puts ~c{6 + 9 = #{6 + 9}}
    IO.puts ~N[2023-02-13 21:37:00]
    # IO.puts ~U[2023-06-21 21:37:00] <-- don't know how to make this one work
  end
end

Main.main

