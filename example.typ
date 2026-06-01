#import ".template.typ": ans, note, que, template, title-page
#set text(font: "JetBrains Mono")

#show: template

#title-page(
  title: "Advanced Machine Learning",
  subtitle: "Neural Network Architectures",
  author: "Himanshu",
  id: "2022",
)

= Introduction

#question[
  Explain backpropagation.
]

#answer[
  Backpropagation computes gradients using the chain rule.

  #kvtable(
    "Framework", "PyTorch",
    "Optimizer", "Adam",
    "Learning Rate", "0.001",
    "Epochs", "100",
  )

  #note(type: "tip", label: "Hello")[
    It enables efficient weight updates.
  ]

  #watermark(image("./assets/exp6.png", width: 100%))

]
