# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_11_173129) do

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "usuario"
    t.string "password_digest"
    t.string "password_confirmation"
    t.integer "saldo", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.decimal "papel"
    t.index ["email"], name: "index_funcionarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_funcionarios_on_reset_password_token", unique: true
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "foto"
    t.integer "categoria_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "preco"
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id"
  end

  create_table "venders", force: :cascade do |t|
    t.integer "produto_id", null: false
    t.integer "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_venders_on_cliente_id"
    t.index ["produto_id"], name: "index_venders_on_produto_id"
  end

  add_foreign_key "produtos", "categorias"
  add_foreign_key "venders", "clientes"
  add_foreign_key "venders", "produtos"
end
