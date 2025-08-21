// Exemplo simples de Lambda para produtos
exports.handler = async (event) => {
  const route = (event.requestContext && event.requestContext.http && event.requestContext.http.path) || event.path || "/";
  if (route === "/products" && (event.requestContext.http.method === "GET" || event.httpMethod === "GET")) {
    // Em produção, consultar RDS; aqui retornamos mock
    return {
      statusCode: 200,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify([
        { id: 1, name: "Paracetamol 750mg", price: 15.90, stock: 120 },
        { id: 2, name: "Dipirona 500mg", price: 9.50, stock: 200 }
      ])
    };
  }

  if (route === "/health") {
    return { statusCode: 200, body: "ok" };
  }

  return { statusCode: 404, body: "Not found" };
};
