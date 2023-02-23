export class GameService {
  async emit(endpoint: string, data = {}): Promise<void> {
    const response = await fetch(
      `https://${GetParentResourceName()}/${endpoint}`,
      {
        method: "post",
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(data),
      }
    );

    return response.json();
  }
}
