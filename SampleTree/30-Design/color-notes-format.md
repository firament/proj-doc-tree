
## Make as cards, wrap horizontally
```css
    .container {
      display: flex;
      flex-direction: row-reverse; /* Cards flow from right to left */
      gap: 20px; /* Adds space between cards */
      justify-content: flex-start; /* Align items to the start (right side) */
      flex-wrap: wrap; /* Allow cards to wrap to the next line */
    }

    .card {
      width: 200px;
      height: 300px;
      background-color: lightblue;
      padding: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
```
