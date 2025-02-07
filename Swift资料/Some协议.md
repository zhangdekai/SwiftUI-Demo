# Swift part of 协议

## CaseIterable —— 让枚举支持遍历

Text作用：
让 enum 具备 自动枚举所有 case 的能力
生成 allCases 属性（一个包含所有 case 的数组）

```
enum Fruit: CaseIterable {
    case apple, banana, orange
}

// 直接访问所有 case
let allFruits = Fruit.allCases
print(allFruits)  // [apple, banana, orange]

// 遍历枚举
for fruit in Fruit.allCases {
    print(fruit)
}

📌 场景：

用于 Picker、SegmentedControl 之类的 UI 组件时，可以自动提供选项：

Picker("Select a fruit", selection: $selectedFruit) {
    ForEach(Fruit.allCases, id: \.self) { fruit in
        Text("\(fruit)")
    }
}


```

❗ 限制：

只能用于 enum，不能用于 struct 或 class。
不支持带参数的 case：

```
enum Shape: CaseIterable {
    case circle(radius: Double)  // ❌ 错误，带参数的 case 不能用 CaseIterable
}

```


## Identifiable —— 让数据可唯一识别

作用：
让对象具有 唯一 ID，用于 SwiftUI 组件（如 List、ForEach）
避免 ForEach 需要 id: \.self 造成的重复项问题

```
struct User: Identifiable, Codable {
    var id: Int  // 来自 JSON 的唯一 ID
    var name: String
}

```

结合使用 CaseIterable 和 Identifiable
如果 enum 需要在 ForEach 里用，可以 同时实现 Identifiable 和 CaseIterable：

```
enum Animal: String, CaseIterable, Identifiable {
    case dog, cat, rabbit

    var id: String { self.rawValue }  // 让它可用于 List 或 Picker
}

List(Animal.allCases) { animal in
    Text(animal.rawValue.capitalized)
}

✅ 这样 Animal 既可以遍历，又可以唯一识别，在 SwiftUI 里直接用！


```


