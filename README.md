# Поисковый движок

Библиотечная функция `searchEngine(documents, needle)` — полнотекстовый поиск
по набору документов на основе TF‑IDF: строит инвертированный индекс терминов
для каждого документа, взвешивает термин запроса по TF‑IDF в каждом
документе и возвращает id документов, отсортированные по убыванию
релевантности.

### Hexlet tests and linter status:
[![Actions Status](https://github.com/mikitasazan/algorithms-project-69/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/mikitasazan/algorithms-project-69/actions)

## Стек

- Node.js (ESM)
- lodash — работа с коллекциями/объектами при построении индекса
- Jest — тесты (фикстуры теста — часть проверки Hexlet, в репозитории не хранятся)

## Проверка локально

Готового приложения нет — это библиотечная функция, экспортируемая из
`src/index.js`. Проверить её можно прямо в Node REPL:

```bash
npm ci
node --input-type=module -e '
import searchEngine from "./src/index.js";
const documents = [
  { id: "doc1", text: "the cat sat on the mat" },
  { id: "doc2", text: "the dog barked at the cat" },
  { id: "doc3", text: "birds fly in the sky" },
];
console.log(searchEngine(documents, "cat"));       // [ "doc2", "doc1" ]
console.log(searchEngine(documents, "dog"));        // [ "doc2" ]
console.log(searchEngine(documents, "birds sky"));  // [ "doc3" ]
'
```

Примечание: токенизация терминов использует `\w+` без Unicode-флага, поэтому
функция ищет по латинице/цифрам — с кириллическим текстом инвертированный
индекс будет пустым.
