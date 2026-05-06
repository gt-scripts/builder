# Builder

Template de repositório para recursos FiveM com pipeline de build automatizado via GitHub Actions. Ao criar um novo repositório a partir deste template, o recurso já vem equipado com automação para compilar, versionar e publicar releases no GitHub.

---

## Sumário

- [Visão Geral](#visão-geral)
- [Como Funciona](#como-funciona)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Configuração](#configuração)
- [Como Usar o Template](#como-usar-o-template)
- [Versioning e Releases](#versioning-e-releases)

---

## Visão Geral

O **Builder** é um template GitHub que integra o [`lua_builder`](https://github.com/gt-scripts/lua_builder) para automatizar o processo de build de recursos FiveM. A cada push na branch `main`, o GitHub Actions:

1. Lê a versão do arquivo `version`
2. Injeta versão, nome do repositório e autor no `fxmanifest.lua`
3. Executa o `lua_builder` para compilar os scripts Lua
4. Exclui as pastas listadas em `ignored_directories.txt`
5. Cria uma GitHub Release com o `.zip` do recurso compilado

---

## Como Funciona

```
push para main
     ↓
GitHub Actions (build-on-push.yml)
     ↓
Lê version file → substitui placeholders no fxmanifest.lua
     ↓
Instala Lua 5.4 → clona gt-scripts/lua_builder → executa build
     ↓
Empacota resultado em .zip (excluindo ignored_directories.txt)
     ↓
Cria GitHub Release com tag v{version} e .zip como asset
```

---

## Estrutura do Projeto

```
builder/
├── .github/
│   └── workflows/
│       └── build-on-push.yml   # Pipeline de CI/CD
├── client/
│   └── *.lua                   # Scripts de cliente
├── server/
│   └── *.lua                   # Scripts de servidor
├── fxmanifest.lua              # Manifest do recurso FiveM
├── version                     # Versão atual (ex: 1.0.0)
└── ignored_directories.txt     # Pastas a excluir do build
```

---

## Configuração

### `fxmanifest.lua`

O manifest contém placeholders que são substituídos automaticamente pelo workflow:

| Placeholder | Substituído por |
|---|---|
| `VERSION_IDENTIFIER` | Conteúdo do arquivo `version` |
| `REPO_NAME` | Nome do repositório GitHub |
| `AUTHOR_NAME` | Owner do repositório GitHub |

Configure manualmente os campos `description` e os paths de scripts (`server_scripts`, `client_scripts`, etc.) de acordo com a estrutura do seu recurso.

### `ignored_directories.txt`

Liste as pastas a excluir do artefato de release (uma por linha):

```
node_modules
tests
.github
```

### `version`

Arquivo de texto simples com a versão semântica:

```
1.0.0
```

Atualize este arquivo a cada push na `main` para que o workflow gere um novo release com a tag correta.

---

## Como Usar o Template

1. Clique em **"Use this template"** no GitHub para criar um novo repositório
2. Edite `fxmanifest.lua` com a descrição, scripts e dependências do seu recurso
3. Adicione seus scripts Lua em `client/` e `server/`
4. Liste pastas a ignorar no build em `ignored_directories.txt`
5. Defina a versão inicial em `version` (ex: `1.0.0`)
6. Faça push para `main` — o workflow cria a Release automaticamente

---

## Versioning e Releases

- O workflow dispara em todo push para `main`
- A tag da release tem o formato `v{version}` (ex: `v1.0.0`)
- O asset da release é o `.zip` do recurso compilado, pronto para copiar para `resources/` do servidor FiveM
- Se o arquivo `version` não existir, o workflow ainda executa — crie um novo commit com o arquivo para normalizar
- O workflow requer permissão `contents: write` no repositório (padrão para Actions)
