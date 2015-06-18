def select_books_titles_and_years_in_first_series_order_by_year
  sql = <<-SQL
  SELECT books.title, books.year 
  FROM series
  INNER JOIN books
  ON series.id = books.series_id
  WHERE series.id = 1;
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  sql = <<-SQL
  SELECT name, motto FROM characters WHERE LENGTH(motto)=(SELECT MAX(LENGTH(motto)) FROM characters);
  SQL
end

def select_value_and_count_of_most_prolific_species
  sql = <<-SQL
  SELECT species, 
  COUNT(species) as speciescount
  FROM characters 
  GROUP BY species
  ORDER BY speciescount DESC
  LIMIT 1;
  SQL
end

def select_name_and_series_subgenres_of_authors
  sql = <<-SQL
  SELECT authors.name, subgenres.name 
  FROM series 
  INNER JOIN authors ON authors.id = series.author_id
  INNER JOIN subgenres ON subgenres.id = series.subgenre_id
  GROUP BY authors.name
  ORDER BY authors.name
  ;
  SQL
end

def select_series_title_with_most_human_characters
  sql = <<-SQL
  SELECT series.title
  FROM series
  INNER JOIN characters
  ON series.id = characters.series_id
  WHERE (SELECT COUNT(species) FROM characters)
  GROUP BY series.title
  ORDER BY (SELECT COUNT(species) FROM characters)
  LIMIT 1
  ;

  SQL
end

def select_character_names_and_number_of_books_they_are_in
  sql = <<-SQL
  SELECT characters.name,--characters.name, 
  COUNT(books.id) as character_count
  FROM character_books 
  INNER JOIN characters ON characters.id = character_books.character_id
  INNER JOIN books ON books.id = character_books.book_id
  GROUP BY characters.name
  ORDER BY character_count DESC;
  --LIMIT 1;
  SQL

end
