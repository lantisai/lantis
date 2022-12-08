import { serve } from "https://deno.land/std@0.131.0/http/server.ts"

console.log("Hello from Functions!")

async function ask(prompt: string): Promise<[string]> {
  const gpt3Endpoint = 'https://api.openai.com/v1/completions';
  const apiKey = Deno.env.get('OPENAI_API_KEY');

  const response = await fetch(gpt3Endpoint, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      'prompt':prompt ,
      'model': 'text-davinci-003',
      'temperature': 0.7,
      'max_tokens': 64,
      'n': 2,
      // 'top_p': 1,
      // 'stop': '\n',
      // 'stream': false,
      // 'best_of': 1,
      // 'presence_penalty': 0,
      // 'frequency_penalty': 0,
    }),
  });

  if (response.ok) {
    const { choices } = await response.json();
    const texts = choices.map((x: {text: string}) => x.text.trim())
    return texts;
  } else {
    throw Error(`${response.statusText}: ${await response.text()}`)
  }
}

serve(async (req) => {
  // This is the input text for the request
  const topics = [
    "AI and ML",
    "Data science",
    "Robotics",
    "Computer science",
    "Biotechnology",
    "Environmental science",
    "Quantum computing",
    "Renewable energy",
  ]

  // const out = await Promise.all(topics.map(topic =>
  //   ask(`tell me about a cool paper in ${topic}`)
  //     .then(texts => ({topic, texts}))));

  const out = [
    {
      "topic": "AI and ML",
      "texts": [
        "One cool paper in AI and ML is \"Deep Reinforcement Learning for Dialogue Generation\" by Jiwei Li, Michel Galley, Chris Brockett, and Bill Dolan (2016). This paper proposed a novel end-to-end deep reinforcement learning algorithm for dialogue generation. The algorithm uses a recurrent neural network",
        "A recent paper in AI and ML that has gained a lot of attention is \"Deep Learning with Differentiable Constraints\" by Akshay Agrawal et al. This paper proposes a novel method of implementing differentiable constraints in deep learning, allowing for more accurate predictions and faster training. The authors demonstrate"
      ]
    },
    {
      "topic": "Data science",
      "texts": [
        "One of the most interesting papers in Data Science is \"A Few Useful Things to Know about Machine Learning\" by Pedro Domingos. The paper provides an overview of the most important concepts in machine learning, such as inductive bias, the bias-variance tradeoff, overfitting, regularization, and",
        "One cool paper in Data Science is \"Deep Convolutional Neural Networks for Image Classification\" by Alex Krizhevsky, Ilya Sutskever and Geoffrey Hinton. This paper introduces a deep convolutional neural network architecture that achieved state-of-the-art results on the ImageNet"
      ]
    },
    {
      "topic": "Robotics",
      "texts": [
        "One interesting paper in robotics is “An Autonomous Soft Robotic System for Reaching and Grasping” (IEEE Robotics and Automation Letters, 2019). This paper presents a soft robotic system that is able to autonomously reach and grasp an object. The system uses an array of soft p",
        "One cool paper in Robotics is \"A Neural Network Playground: Learning Control Policies for a Quadruped Robot\" by Sergey Levine et al. (2018). This paper presents a novel control framework for a quadruped robot, based on deep reinforcement learning. The authors demonstrate the use of a simple neural network,"
      ]
    },
    {
      "topic": "Computer science",
      "texts": [
        "One of the most interesting and groundbreaking papers in computer science is \"A Theory of Computation\" by Alan Turing. In this paper, Turing proposed the Turing Machine, a hypothetical device that could read and write symbols on an infinite tape, and could be used to solve any computable problem. He also defined the",
        "One of the most interesting papers in Computer Science is \"Deep Learning for Complex Network Representation Learning\" by Zhang et al. (2019). This paper introduces a novel deep learning approach to network representation learning, which is a powerful tool for learning the structure of complex networks. The authors propose a model which consists of"
      ]
    },
    {
      "topic": "Biotechnology",
      "texts": [
        "One interesting paper in biotechnology is titled \"Harnessing the Power of Synthetic Biology for Sustainable Bioproduction\" published in Nature Reviews Microbiology, 2018. The paper discusses the potential of synthetic biology to revolutionize the production of food, fuel, and materials. It outlines the ways in which synthetic",
        "One cool paper in biotechnology is \"Synthetic Biology: Engineering Escherichia coli to See Light\" by Christopher Voigt et al. This paper discusses a new technique developed by the authors that allowed them to genetically engineer the bacterium Escherichia coli to detect blue light. This research"
      ]
    },
    {
      "topic": "Environmental science",
      "texts": [
        "One cool paper in Environmental Science is \"Integrating Ecosystem Services and Human Well-Being: A Practical Approach to Sustainable Development\" by Kirsten Kern and Rudiger Ahrend. This paper explains the concept of Ecosystem Services and how they are essential for human well-being, and outlines practical strategies to",
        "One cool paper in Environmental Science is titled \"Climate Change and Its Impact on the Health of the Global Population.\" This paper, written by researchers from the University of Oxford and published in the journal Environmental Health Perspectives, looks at the potential effects of climate change on human health. The paper discusses the increasing impact of"
      ]
    },
    {
      "topic": "Quantum computing",
      "texts": [
        "A recent paper entitled \"Quantum Computing and the Entanglement Revolution\" showcases a new approach to quantum computing. This paper explains how entanglement can be used to achieve quantum speedup, and it also delves into the history of quantum computing, discussing the various theoretical and practical approaches that have been taken",
        "One of the coolest recent papers in quantum computing is \"Quantum Supremacy Using a Programmable Superconducting Processor\" by Google AI Quantum, published in Nature in October 2019. In this paper, Google reported that their quantum processor, Sycamore, was able to perform a calculation in only 200 seconds"
      ]
    },
    {
      "topic": "Renewable energy",
      "texts": [
        "A great paper to check out is \"Innovative Renewable Energy Technologies for Sustainable Development,\" written by James P. Quirk and published in Renewable and Sustainable Energy Reviews in 2019. In this paper, Quirk examines several innovative renewable energy technologies and their potential for providing sustainable development in the future. He",
        "One cool paper in Renewable Energy is entitled \"A Review of Renewable Energy Sources and Technologies\" by Daniel B. Haber and published in the International Journal of Engineering and Technology. The paper provides an overview of the various renewable energy sources and technologies, highlighting their advantages and disadvantages. It also discusses the global"
      ]
    }
  ]

  // console.log(out);

  const tweets = out.map(({topic, texts}) => texts.map(text => ({title: topic, text})))
    .flat(1);

  return new Response(
    JSON.stringify(tweets),
    { headers: { "Content-Type": "application/json" } },
  )
})
