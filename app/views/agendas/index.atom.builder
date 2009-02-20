atom_feed do |feed|
  feed.title("Ana Couto Branding & Design | Cadastro de Clientes")
  feed.updated(@agendas.first.created_at)
  for agenda in @agendas
    feed.entry(agenda) do |entry|      
      entry.title(agenda.empresa)
      entry.content([agenda.tipo,"<br>",agenda.celular,"<br>",agenda.endereco], :type => 'html')
      entry.author do |author|
        author.name("Ana Couto Branding & Design")
      end

    end       
  end
end