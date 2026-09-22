# Stim.jl — estudos de otimização em Julia

Repositório acadêmico de Tópicos Especiais em Matemática Industrial, com Julia, JuMP e Cbc.

## Conteúdo versionado

- `src/knapsack.jl`: modelo de mochila binária com maximização de lucro.
- `src/dantzig_relaxation.jl`: estudo de relaxação.
- `test/runtests.jl`: testes existentes, não reexecutados nesta revisão.
- `Project.toml`: dependências do projeto.

## Estado e relação com o ORKit

Estudo acadêmico preservado, potencial referência para a futura trilha Julia/JuMP. Não é um pacote de produção nem uma dependência do novo piloto. Antes de integrá-lo, revisar a compatibilidade, validar os testes e atualizar a documentação matemática. Foi identificado um texto “Min” na docstring da mochila enquanto o código maximiza; a documentação foi corrigida para refletir o código.

O trabalho educacional atual está em [orkit-free](https://github.com/helano-pessoa/orkit-free). A licença existente em `LICENSE.md` permanece inalterada.

## Pendências técnicas identificadas por inspeção

- A rotina de relaxação não encerra o preenchimento após usar uma fração de item; isso pode violar a capacidade em iterações seguintes.
- `test/runtests.jl` define `tests()` sem chamá-la. Também espera três retornos da relaxação, que retorna dois, e supõe objetivo inteiro onde pode haver ponto flutuante.

Esses pontos não foram corrigidos silenciosamente sem execução em Julia. O módulo precisa de revisão e testes efetivos antes de ser usado como referência no produto.
