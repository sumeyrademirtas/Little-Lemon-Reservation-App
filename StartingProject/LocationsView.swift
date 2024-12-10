import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model: Model
    var body: some View {
        VStack {
            LittleLemonLogo() // 1
                .padding(.top, 50)

            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location") // 2
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)

            NavigationView {
                // Replace EmptyView() // 3 with a List and NavigationLink
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant) // Display restaurant info
                    }
                }
                .navigationBarTitle("") // Remove navigation bar title
                .navigationBarHidden(true) // Hide navigation bar
            }
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}
