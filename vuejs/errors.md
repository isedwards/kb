## Cannot read property '__vccOpts' of undefined

Occurred when I didn't include all of the components that I used in my own component in the default export for `my-component.vue`
```
    export default {
        name: 'my-component',
        components: { BarChart, ... }
    }
```
